// tipo do nosso shader é canvas_item
shader_type canvas_item;

//declarar variavel pra acessar no programa com nome color e time
uniform vec4 color = vec4(1, 1, 1, 1.0); 
uniform float time = 1;
uniform float vitor = 1.0; // you can assign a default value to uniforms

// fragment = coisa que vem por padrão no SHADERS
void fragment() {
	
//declarar variavel com o VALOR ABSOLUTO DO COSSENO DO TIME
	 float pulse = tan(TIME);

    // Creating a color gradient based on particle's lifetime
    // Adjust colors as per your preference
    vec4 start_color = vec4(0.5, 0, 1, 1.0); // roxo
    vec4 end_color = vec4(1, 0, 0, 0.2); // vermelho

    // Interpolating between start and end colors based on particle's lifetime
    vec4 particle_color = mix(start_color, end_color, pulse);
	
	 // Applying blend_mix to control the blending of colors
    vec4 final_color = vec4(
//       mix (1 + 1)*0.5 = 1
        mix(start_color.r, particle_color.r, 1),
        mix(start_color.g, particle_color.g, 1),
        mix(start_color.b, particle_color.b, 1),
        mix(start_color.a, particle_color.a, 1)
    );
	
	//= vec4 final_color = vec4(red, green, blue, alpha)

// PROPRIEDADE COR DO OBJETO RECEBE VALOR DE COR CALCULADA ACIMA VEZES COR INICIAL
    COLOR = final_color * color;
	
  //COLOR = vec4(UV, 0.5, 1.0);

// This shader will result in a blue-tinted icon
  //COLOR.b = vitor;


//var vitor_value = 1.0;
//material.set_shader_parameter("vitor", vitor_value)
}

// vertex = coisa que vem por padrão no SHADERS, mexer na posicao dos vértices do objeto
void vertex() {
 // Animate Sprite2D moving in a big circle around its location
    VERTEX += vec2(cos(TIME) * 120.0, sin(TIME) * 50.0);
	VERTEX += vec2(cos(TIME) * 10.0, sin(TIME) * 10.0);
}