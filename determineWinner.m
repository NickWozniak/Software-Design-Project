function determineWinner(card_playerSum, card_houseSum)
    if(card_houseSum > 21) %House busts
        card_houseSum = 0;
    end
    if(card_playerSum > 21) %Player busts
        card_playerSum = 0;
    end
    if(card_houseSum > card_playerSum)
        fprintf("The house wins!\n")
    elseif (card_houseSum < card_playerSum)
        fprintf("The player wins!\n")
    else
        fprintf("It is a tie!\n")
    end
end