function [card_sum] = sumCards(player, card_display, num_cards)
hearts = (21:33);
diamonds = (34:46);
clubs = (47:59);
spades = (60:72);
card_sum = 0;
for i=2:(num_cards+1)
    card_value = 0;
    if (card_display(player,i) ~= 1)
        current_card = card_display(player,i);
        for j=1:13
            if (current_card == hearts(j))
                card_value = j;
                if (card_value > 10)
                    card_value = 10;
                elseif (card_value == 1)
                    card_value = [11,1];
                end
            elseif (current_card == diamonds(j))
                card_value = j;
                if (card_value > 10)
                    card_value = 10;
                elseif (card_value == 1)
                    card_value = [11,1];
                end
            elseif (current_card == clubs(j))
                card_value = j;
                if (card_value > 10)
                    card_value = 10;
                elseif (card_value == 1)
                    card_value = [11,1];
                end
            elseif (current_card == spades(j))
                card_value = j;
                if (card_value > 10)
                    card_value = 10;
                elseif (card_value == 1)
                    card_value = [11,1];
                end
            end
        end
        if(length(card_value) == 2 && card_sum > 10)
            card_sum = card_sum + card_value(2);
        else
            card_sum = card_sum + card_value(1);
        end
    end

end
end