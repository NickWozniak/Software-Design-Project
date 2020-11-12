function [card_display,card_background] = drawCard(row, card_display,card_background, column)
card_sprites = 21:72;
white_background = 2;
card_display(row,(column+2)) = card_sprites(randi(52));
card_background(row,(column+2)) = white_background;

end
