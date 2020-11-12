git tag -a v1.0
% Initialize scene
my_scene = simpleGameEngine('retro_cards.png',16,16,8,[0,150,0]);

% Set up variables to name the various sprites
empty_sprite = 1;
card_sprites = 21:72;
white_background = 2;
hidden_card = 4;

% Set up variables to name player (1) or house (3) turn
player = 3; %Player's cards are on row 3
house = 1; %House's cards are on row 1
%% Initialize card table
card_display = empty_sprite * ones(3,5);
card_background = empty_sprite * ones(3,5);

%Initialize Player
current_player = player;
num_playerCards = 0;
for i=1:2 %Draw two cards to start
    [card_display, card_background] = drawCard(current_player, card_display, card_background, num_playerCards);
    num_playerCards = num_playerCards + 1;
end

%Initialize House
current_player = house;
num_houseCards = 0;
[card_display, card_background] = drawCard(current_player, card_display, card_background, num_houseCards); %Draw 1 card
card_display(1,3) = hidden_card; %Show a hidden card
card_background(1,3) = white_background;

%Display table
drawScene(my_scene,card_background,card_display)

%% Player turn
current_player = player;
card_playerSum = sumCards(current_player, card_display, num_playerCards);
while(card_playerSum <= 21) %Player can draw cards unless they bust (>21)
    input = getKeyboardInput(my_scene);
    if(input == 'h')
        [card_display, card_background] = drawCard(current_player, card_display, card_background, num_playerCards);
        num_playerCards = num_playerCards + 1;
        drawScene(my_scene,card_background,card_display)
        card_playerSum = sumCards(current_player, card_display, num_playerCards);
    else
        break
    end
end
%% House turn
current_player = house;
card_houseSum = sumCards(current_player, card_display, num_houseCards);
while(card_houseSum < 17) %House must draw a card until they are above 17
    [card_display, card_background] = drawCard(current_player, card_display, card_background, num_houseCards);
    num_houseCards = num_houseCards + 1;
    drawScene(my_scene,card_background,card_display)
    card_houseSum = sumCards(current_player, card_display, num_houseCards);
end
%% Determine the winner
determineWinner(card_playerSum, card_houseSum)
    
