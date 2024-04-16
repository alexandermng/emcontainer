#include <stdint.h>
#include <stddef.h>

uint8_t max_byte(const uint8_t *data, size_t len)
{
    uint8_t max = 0;
    for (size_t i = 0; i < len; i++)
        if (data[i] > max)
            max = data[i];
    return max;
}
