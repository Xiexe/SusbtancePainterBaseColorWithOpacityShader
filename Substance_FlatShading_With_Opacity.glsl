import lib-sampler.glsl
import lib-alpha-test.glsl

//: param auto channel_basecolor
uniform SamplerSparse basecolor_tex;

//: state blend over {"enable":"input.alphaBlendEnabled"}

void shade(V2F inputs) {
    vec3 color = getBaseColor(basecolor_tex, inputs.sparse_coord);
    diffuseShadingOutput(color);

    float alpha = getOpacity(opacity_tex, inputs.sparse_coord);
    alphaOutput(alpha);

    alphaKill(inputs.sparse_coord);
}