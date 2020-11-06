clc
clear
close all


% Initialize scene
my_scene = simpleGameEngine('retro_cards.png',16,16,8,[0,100,0]);

% Set up variables to name the various sprites
empty_sprite = 1;
blank_card_sprite = 2;
trump_card_sprite = 7;
card_sprites = 21:72;

% The first layer is made up of the blank cards
card_display = blank_card_sprite * ones(1,5);

% Shuffle the deck and use the first 5 in the hand
ShuffledDeck = randperm(52); % Random permutation of numbers 1 to 52
hand = ShuffledDeck(1:5);

% The second layer includes the faces of the cards
face_display = card_sprites(hand);

% Now suppose Hearts is the trump suit in Euchre (or a similar game)
% To highlight the trump cards, let's change their background
for card = 1:5
    if hand(card) <= 13 % Hearts are the first 13 cards in the sprite sheet
        card_display(card) = trump_card_sprite;
    end
end

% Display the scene
drawScene(my_scene,card_display,face_display)


