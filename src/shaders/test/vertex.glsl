uniform mat4 projectionMatrix; // Transform the coordinates into the clip space coordinate
uniform mat4 viewMatrix; // Apply transformations relative to the camera (position, rotation, fov, near, far)
uniform mat4 modelMatrix; // Apply transformations relative to the MEsh (position, rotation, scale)

attribute vec3 position;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += sin(modelPosition.x * 10.0) * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}