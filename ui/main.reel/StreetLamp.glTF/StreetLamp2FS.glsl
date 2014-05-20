precision highp float;
varying vec3 v_normal;
uniform vec3 u_light0Color;
varying vec3 v_light0Direction;
uniform vec3 u_light1Color;
varying vec3 v_light1Direction;
uniform vec3 u_light2Color;
varying vec3 v_light2Direction;
uniform vec4 u_diffuse;
void main(void) {
vec3 normal = normalize(v_normal);
vec4 color = vec4(0., 0., 0., 0.);
vec4 diffuse = vec4(0., 0., 0., 1.);
vec3 diffuseLight = vec3(0., 0., 0.);
{
float diffuseIntensity;
float specularIntensity;
diffuseIntensity = max(dot(normal,normalize(v_light0Direction)), 0.);
diffuseLight += u_light0Color * diffuseIntensity;
}
{
float diffuseIntensity;
float specularIntensity;
diffuseIntensity = max(dot(normal,normalize(v_light1Direction)), 0.);
diffuseLight += u_light1Color * diffuseIntensity;
}
{
float diffuseIntensity;
float specularIntensity;
diffuseIntensity = max(dot(normal,normalize(v_light2Direction)), 0.);
diffuseLight += u_light2Color * diffuseIntensity;
}
diffuse = u_diffuse;
diffuse.xyz *= diffuseLight;
color.xyz += diffuse.xyz;
color = vec4(color.rgb * diffuse.a, diffuse.a);
gl_FragColor = color;
}
