/// @description deactivates after TTL expires
if (time_to_live <= 0) instance_deactivate_object(self)