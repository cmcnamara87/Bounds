<?php
// update_resource.inc
/**
 * Callback for creating update resources.
 *
 * @param object $data
 * @return object
 */
function _update_resource_create($data) {
    global $user;
    if (isset($data) &&  is_array($data)) $data=(object) $data;
    unset($data->id);
    $data->uid = $user->uid;
    $data->created = time();
    $data->modified = time();

    update_save($data);

    return (object)$data;
}

// update_resource.inc
/**
 * Callback for updating update resources.
 *
 * @param int $id
 * @param object $data
 * @return object
 */
function _update_resource_update($id, $data) {

    global $user;
    $update = update_load($id);

    unset($data->created);
    $data->id = $id;
    $data->uid = $update->uid;
    $data->modified = time();

    update_save($data);

    return (object)$data;
}
/**
 * Callback for retrieving update resources.
 *
 * @param int $id
 * @return object
 */
function _update_resource_retrieve($id) {
    return update_load($id);
}

/**
 * Callback for deleting update resources.
 *
 * @param int $id
 * @return object
 */
function _update_resource_delete($id) {
    update_delete($id);

    return (object)array(
        'id' => $id,
    );
}

function _update_resource_index($page, $fields, $parameters, $page_size) {
    $query = new EntityFieldQuery();

    $query->entityCondition('entity_type', 'update');

    foreach($parameters as $parameter => $value) {
        $query->propertyCondition($parameter, $value);
    }
    $query->range($page * $page_size, $page_size);
    $query->propertyOrderBy('created', 'DESC');

    $result = $query->execute();
    $ids = array_keys($result['update']);

    return update_load_multiple($ids);
}

/**
 * Access callback for the update resource.
 *
 * @param string $op
 *  The operation that's going to be performed.
 * @param array $args
 *  The arguments that will be passed to the callback.
 * @return bool
 *  Whether access is given or not.
 */

function _update_resource_access($op, $args) {
    global $user;
    $access = FALSE;

    switch ($op) {
        case 'create':
            return true;
        case 'view':
            $update = update_load($args[0]);
            $access = user_access('update resource view any update');
            $access = $access || $update->uid == $user->uid && user_access('update resource view own updates');
            break;
        case 'update':
            $update = update_load($args[0]->id);
            $access = user_access('update resource edit any update');
            $access = $access || $update->uid == $user->uid && user_access('update resource edit own updates');
            break;
        case 'delete':
            $update = update_load($args[0]);
            $access = user_access('update resource delete any update');
            $access = $access || $update->uid == $user->uid && user_access('update resource delete own updates');
            break;
    }
    $access = TRUE;

    return $access;
}