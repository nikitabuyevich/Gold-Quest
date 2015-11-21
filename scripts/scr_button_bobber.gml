/*Created by SlasherX
As seen on SlasherXGAMES
https://www.youtube.com/user/SlasherXGAMES

The following should be set up in the button object.
CREATE event:
defSize = 1;
size = defSize;
scale_down = true;
scale_up = false;

DRAW event:
draw_sprite_ext(sprite_index, image_index, x, y, size, size, image_angle, c_white, image_alpha);

This script is then called in object's STEP event.
*/

minSize = argument0;//minimum size
maxSize = argument1;//maximum size
sizeIncrement = argument2;//how much to increase or decrease per step
defaultSize = argument3;//size when mouse isn't hovering over it

if (position_meeting(mouse_x, mouse_y, self))//if the mouse is hovering over instance
{
    if (scale_down == true)//if instance should be scaled down
    {
        if (size <= minSize)//if size is less than or equal to minimum
        {
            if (size < minSize)//make sure size doesn't get below minimum
            {
                size = minSize;//if it does, set size to minimum
            }

            scale_down = false;//stop scaling down
            scale_up = true;//start scaling up
        }
        else//otherwise
        {
            size -= sizeIncrement;//decrease size of instance
        }
    }
    
    if (scale_up == true)//if instance should be scaled up
    {
        if (size >= maxSize)//if size is greater than or equal to maximum
        {
            if (size > maxSize)//make sure size doesn't get above maximum
            {
                size = maxSize;//if it does, set size to maximum
            }

            scale_down = true;//start scaling down
            scale_up = false;//stop scaling up
        }
        else
        {
            size += sizeIncrement;//increase size of instance
        }
    }
}
else//if mouse is not over instance
{
    size = defaultSize;//size is set to default
}
