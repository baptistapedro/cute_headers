#define CUTE_PNG_IMPLEMENTATION
#include "cute_png.h"

int main(int argc, char **argv)
{
    if (argc < 2) {
    	printf("Usage: bin input\n");
    }
    cp_image_t img = cp_load_png(argv[1]);
    if (img.pix) {
    	printf("ok");
    } else {
    	return 1;
    }
    
    free(img.pix);
    return 0;
    
}
