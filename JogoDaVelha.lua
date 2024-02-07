function print_board(board)
    for i = 1, 3 do
        for j = 1, 3 do
            io.write(board[i][j] .. " ")
        end
        print()
    end
end

function check_win(board, player)
    for i = 1, 3 do
        if board[i][1] == player and board[i][2] == player and board[i][3] == player then
            return true
        end
        if board[1][i] == player and board[2][i] == player and board[3][i] == player then
            return true
        end
    end
    if board[1][1] == player and board[2][2] == player and board[3][3] == player then
        return true
    end
    if board[1][3] == player and board[2][2] == player and board[3][1] == player then
        return true
    end
    return false
end

function play_game()
    local board = {
        {"-", "-", "-"},
        {"-", "-", "-"},
        {"-", "-", "-"}
    }
    local player = "X"
    local moves = 0

    print("Bem-vindo ao Jogo da Velha!")

    while moves < 9 do
        print_board(board)
        print("É a vez do jogador " .. player)
        print("Digite a linha (1-3) e coluna (1-3) separadas por espaço para fazer sua jogada:")
        local row, col = io.read("*n", "*n")

        if row >= 1 and row <= 3 and col >= 1 and col <= 3 and board[row][col] == "-" then
            board[row][col] = player
            moves = moves + 1

            if check_win(board, player) then
                print_board(board)
                print("Parabéns! O jogador " .. player .. " ganhou!")
                return
            end

            if player == "X" then
                player = "O"
            else
                player = "X"
            end
        else
            print("Jogada inválida. Tente novamente.")
        end
    end

    print_board(board)
    print("O jogo terminou em empate.")
end

play_game()
