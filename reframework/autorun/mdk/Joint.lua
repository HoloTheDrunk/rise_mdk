---@class Joint
---@field _remo JointRemo
local Joint = {}
Joint.__index = Joint

---@param value integer | REManagedObject | userdata
---@return Joint
function Joint.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as JointRemo]]
  }, Joint)
end

---@return boolean
function Joint:is_valid()
  return self._remo:call("get_Valid")
end

---@return Matrix4x4f
function Joint:get_world_matrix()
  return self._remo:call("get_WorldMatrix")
end

---@param world_pos Vector3f
---@return Vector3f
function Joint:world_to_local(world_pos)
  local world_matrix = self:get_world_matrix()

  -- Extract the column vectors of the rotation matrix
  local right = Vector3f.new(world_matrix[0].x, world_matrix[0].y, world_matrix[0].z)
  local up = Vector3f.new(world_matrix[1].x, world_matrix[1].y, world_matrix[1].z)
  local forward = Vector3f.new(world_matrix[2].x, world_matrix[2].y, world_matrix[2].z)

  local origin = Vector3f.new(world_matrix[3].x, world_matrix[3].y, world_matrix[3].z)

  local relative = Vector3f.new(
    world_pos.x - origin.x,
    world_pos.y - origin.y,
    world_pos.z - origin.z
  )

  return Vector3f.new(relative:dot(right), relative:dot(up), relative:dot(forward))
end

---@param local_pos Vector3f
---@return Vector3f
function Joint:local_to_world(local_pos)
  local world_matrix = self:get_world_matrix()

  -- Extract the column vectors of the rotation matrix
  local right = Vector3f.new(world_matrix[0].x, world_matrix[0].y, world_matrix[0].z)
  local up = Vector3f.new(world_matrix[1].x, world_matrix[1].y, world_matrix[1].z)
  local forward = Vector3f.new(world_matrix[2].x, world_matrix[2].y, world_matrix[2].z)

  local origin = Vector3f.new(world_matrix[3].x, world_matrix[3].y, world_matrix[3].z)

  -- origin + rotation * local_pos
  local world_x = origin.x + right.x * local_pos.x + up.x * local_pos.y + forward.x * local_pos.z
  local world_y = origin.y + right.y * local_pos.x + up.y * local_pos.y + forward.y * local_pos.z
  local world_z = origin.z + right.z * local_pos.x + up.z * local_pos.y + forward.z * local_pos.z

  return Vector3f.new(world_x, world_y, world_z)
end

return Joint
