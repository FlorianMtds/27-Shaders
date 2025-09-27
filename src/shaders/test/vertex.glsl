uniform mat4 projectionMatrix; // Transform the coordinates into the clip space coordinate
uniform mat4 viewMatrix; // Apply transformations relative to the camera (position, rotation, fov, near, far)
uniform mat4 modelMatrix; // Apply transformations relative to the Mesh (position, rotation, scale)
uniform vec2 uFrequency;
uniform float uTime;

attribute vec3 position;
// attribute float aRandom;

// varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += sin(modelPosition.x * uFrequency.x + uTime) * 0.1;
    modelPosition.z += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // vRandom = aRandom;

    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}