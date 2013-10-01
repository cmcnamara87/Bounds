<?php
// place_resource.inc
/**
 * Callback for creating place resources.
 *
 * @param object $data
 * @return object
 */
function _place_resource_create($data) {
    global $user;
    if (isset($data) &&  is_array($data)) $data=(object) $data;
    unset($data->id);
    $data->uid = $user->uid;
    $data->created = time();
    $data->modified = time();

    place_save($data);

    return (object)$data;
}

// place_resource.inc
/**
 * Callback for updating place resources.
 *
 * @param int $id
 * @param object $data
 * @return object
 */
function _place_resource_update($id, $data) {

    global $user;
    $place = place_load($id);

    unset($data->created);
    $data->id = $id;
    $data->uid = $place->uid;
    $data->modified = time();

    place_save($data);

    return (object)$data;
}
/**
 * Callback for retrieving place resources.
 *
 * @param int $id
 * @return object
 */
function _place_resource_retrieve($id) {
    return place_load($id);
}

/**
 * Callback for deleting place resources.
 *
 * @param int $id
 * @return object
 */
function _place_resource_delete($id) {
    place_delete($id);

    return (object)array(
        'id' => $id,
    );
}

function _place_resource_index($page, $fields, $parameters, $page_size) {
    $query = new EntityFieldQuery();

    $query->entityCondition('entity_type', 'place');

    foreach($parameters as $parameter => $value) {
        $query->propertyCondition($parameter, $value);
    }
    $query->range($page * $page_size, $page_size);
    $result = $query->execute();
    $ids = array_keys($result['place']);

    return place_load_multiple($ids);
}

/**
 * Access callback for the place resource.
 *
 * @param string $op
 *  The operation that's going to be performed.
 * @param array $args
 *  The arguments that will be passed to the callback.
 * @return bool
 *  Whether access is given or not.
 */

function _place_resource_access($op, $args) {
    global $user;
    $access = FALSE;

    switch ($op) {
        case 'create':
            return true;
        case 'view':
            $place = place_load($args[0]);
            $access = user_access('place resource view any place');
            $access = $access || $place->uid == $user->uid && user_access('place resource view own places');
            break;
        case 'update':
            $place = place_load($args[0]->id);
            $access = user_access('place resource edit any place');
            $access = $access || $place->uid == $user->uid && user_access('place resource edit own places');
            break;
        case 'delete':
            $place = place_load($args[0]);
            $access = user_access('place resource delete any place');
            $access = $access || $place->uid == $user->uid && user_access('place resource delete own places');
            break;
    }
    $access = TRUE;

    return $access;
}