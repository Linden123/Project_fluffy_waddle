var key = other.object_index;
var value = 1;

if (ds_map_exists(inventory, key))
{
value += ds_map_find_value(inventory, key);
ds_map_replace(inventory, key, value);
}
else
{
ds_map_add(inventory, key, value);
ds_list_add(inventoryItems, key);
}
instance_destroy(other);

