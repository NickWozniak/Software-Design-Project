clc
clear
close all


% Initialize scene
my_scene = simpleGameEngine('retro_cards.png',16,16,8,[255,255,255]);

% Set up variables to name the various sprites
empty_sprite = 1;
card_sprites = 21:74;

% Show blank cards
card_display = empty_sprite * ones(1,5);
card_display(1) = card_sprites(10); % 10 of Hearts
card_display(2) = card_sprites(27); % Ace of Clubs
card_display(3) = card_sprites(24); % Jack of Diamonds
card_display(4) = card_sprites(52); % King of Spades
card_display(5) = card_sprites(53); % Red Joker
drawScene(my_scene,card_display)
