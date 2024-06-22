using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace game
{
    public partial class Form1 : Form
    {

        private Random random = new Random();

        private int[] array = new int[52];

        private const int col = 5; private const int row = 5;

        private int[,] player_matrix = new int[col, row];
        private int[,] bot_matrix = new int[col, row];

        private int current_digit;
        private int index = 0;

        private int playerScores = 0;
        private int botScores = 0;


        public Form1()
        {
            InitializeComponent();

            for (int i = 0; i < 52; i++)
            {
                array[i] = 1 + i / 4;
            }
            Shuffle(array);

            for (int i = 0; i < col; i++)
            {
                for (int j = 0; j < row; j++)
                {
                    player_matrix[i, j] = 0;
                    bot_matrix[i, j] = 0;
                }
            }

            current_digit = array[index];
            textBox_CurrentDigit.Text = current_digit.ToString();
        }

        static int CalculateScores(int[,] matrix)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);
            int score = 0;

            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    int row_count = 1;
                    int col_count = 1;
                    int currentNumber = matrix[i, j];

                    if (currentNumber == 0)
                        continue;

                    for (int k = j + 1; k < cols; k++)
                    {
                        if (matrix[i, k] == currentNumber)
                            row_count++;
                    }

                    for (int k = i + 1; k < rows; k++)
                    {
                        if (matrix[k, j] == currentNumber)
                            col_count++;
                    }

                    if (row_count == 2)
                        score += 10;
                    else if (row_count == 3)
                        score += 20;
                    else if (row_count == 4)
                        score += 160;

                    if (col_count == 2)
                        score += 10;
                    else if (col_count == 3)
                        score += 20;
                    else if (col_count == 4)
                        score += 160;
                }
            }

            int diagonalCount = 1;
            int diagonalNumber = matrix[0, 0];
            for (int i = 1; i < rows; i++)
            {
                if (matrix[i, i] == diagonalNumber && diagonalNumber != 0)
                    diagonalCount++;
            }

            if (diagonalCount == 2)
                score += 20;
            else if (diagonalCount == 3)
                score += 30;
            else if (diagonalCount == 4)
                score += 170;

            return score;
        }

        private void end_game()
        {
            if (playerScores > botScores)
            {
                MessageBox.Show($"Вы победили со счетом: ваши очки {playerScores} | очки противика {botScores}");
                Application.Exit();
            }
            else if (playerScores < botScores)
            {
                MessageBox.Show($"Вы проиграли со счетом: ваши очки {playerScores} | очки противика {botScores}");
                Application.Exit();
            }
            else
            {
                MessageBox.Show($"Игра закончилась ничьёй: ваши очки {playerScores} | очки противика {botScores}");
                Application.Exit();
            }
        }

        private void Shuffle(int[] array)
        {
            for (int i = array.Length - 1; i > 0; i--)
            {
                int j = random.Next(i + 1);

                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }

        private void refreshBotbuttons()
        {
            if (bot_matrix[0, 0] != 0) { botButton0_0.Text = bot_matrix[0, 0].ToString(); }

            if (bot_matrix[0, 1] != 0) { botButton0_1.Text = bot_matrix[0, 1].ToString(); }

            if (bot_matrix[0, 2] != 0) { botButton0_2.Text = bot_matrix[0, 2].ToString(); }

            if (bot_matrix[0, 3] != 0) { botButton0_3.Text = bot_matrix[0, 3].ToString(); }

            if (bot_matrix[0, 4] != 0) { botButton0_4.Text = bot_matrix[0, 4].ToString(); }

            if (bot_matrix[1, 0] != 0) { botButton1_0.Text = bot_matrix[1, 0].ToString(); }

            if (bot_matrix[1, 1] != 0) { botButton1_1.Text = bot_matrix[1, 1].ToString(); }

            if (bot_matrix[1, 2] != 0) { botButton1_2.Text = bot_matrix[1, 2].ToString(); }

            if (bot_matrix[1, 3] != 0) { botButton1_3.Text = bot_matrix[1, 3].ToString(); }

            if (bot_matrix[1, 4] != 0) { botButton1_4.Text = bot_matrix[1, 4].ToString(); }

            if (bot_matrix[2, 0] != 0) { botButton2_0.Text = bot_matrix[2, 0].ToString(); }

            if (bot_matrix[2, 1] != 0) { botButton2_1.Text = bot_matrix[2, 1].ToString(); }

            if (bot_matrix[2, 2] != 0) { botButton2_2.Text = bot_matrix[2, 2].ToString(); }

            if (bot_matrix[2, 3] != 0) { botButton2_3.Text = bot_matrix[2, 3].ToString(); }

            if (bot_matrix[2, 4] != 0) { botButton2_4.Text = bot_matrix[2, 4].ToString(); }

            if (bot_matrix[3, 0] != 0) { botButton3_0.Text = bot_matrix[3, 0].ToString(); }

            if (bot_matrix[3, 1] != 0) { botButton3_1.Text = bot_matrix[3, 1].ToString(); }

            if (bot_matrix[3, 2] != 0) { botButton3_2.Text = bot_matrix[3, 2].ToString(); }

            if (bot_matrix[3, 3] != 0) { botButton3_3.Text = bot_matrix[3, 3].ToString(); }

            if (bot_matrix[3, 4] != 0) { botButton3_4.Text = bot_matrix[3, 4].ToString(); }

            if (bot_matrix[4, 0] != 0) { botButton4_0.Text = bot_matrix[4, 0].ToString(); }

            if (bot_matrix[4, 1] != 0) { botButton4_1.Text = bot_matrix[4, 1].ToString(); }

            if (bot_matrix[4, 2] != 0) { botButton4_2.Text = bot_matrix[4, 2].ToString(); }

            if (bot_matrix[4, 3] != 0) { botButton4_3.Text = bot_matrix[4, 3].ToString(); }

            if (bot_matrix[4, 4] != 0) { botButton4_4.Text = bot_matrix[4, 4].ToString(); }
        }

        private void button_click(int i, int j)
        {

            if (player_matrix[i, j] == 0)
            {
                player_matrix[i, j] = current_digit;
                playerScores = CalculateScores(player_matrix);
                textBox_playerScore.Text = playerScores.ToString();
                next_digit();
                bot_turn();
            }
            else
            {
                MessageBox.Show("Ошибка, на этом месте уже есть число");
            }
        }

        private void bot_turn()
        {
            int i;
            int j;
            bool goodTurn = false;

            for (i = 0; i < 5; i++)
            {
                if (!goodTurn)
                {
                    for (j = 0; j < 5; j++)
                    {
                        if (bot_matrix[i, j] == 0)
                        {
                            bot_matrix[i, j] = current_digit;
                            if (CalculateScores(bot_matrix) > botScores)
                            {
                                goodTurn = true;
                                break;
                            }
                            else
                            {
                                bot_matrix[i, j] = 0;
                            }
                        }
                    }
                }
                else
                {
                    break;
                }
            }

            if (!goodTurn)
            {
                do
                {
                    i = random.Next(0, row);
                    j = random.Next(0, col);
                } while (bot_matrix[i, j] != 0);
                bot_matrix[i, j] = current_digit;
            }

            botScores = CalculateScores(bot_matrix);
            textBox_botScore.Text = botScores.ToString();
            refreshBotbuttons();
            next_digit();

            if (index >= 50)
            {
                end_game();
            }
        }

        private void next_digit()
        {
            index++;
            current_digit = array[index];
            textBox_CurrentDigit.Text = current_digit.ToString();

        }


        private void button0_0_Click(object sender, EventArgs e)
        {
            button_click(0, 0);

            button0_0.Text = player_matrix[0, 0].ToString();
        }

        private void button0_1_Click(object sender, EventArgs e)
        {
            button_click(0, 1);

            button0_1.Text = player_matrix[0, 1].ToString();
        }

        private void button0_2_Click(object sender, EventArgs e)
        {
            button_click(0, 2);

            button0_2.Text = player_matrix[0, 2].ToString();
        }

        private void button0_3_Click(object sender, EventArgs e)
        {
            button_click(0, 3);

            button0_3.Text = player_matrix[0, 3].ToString();
        }

        private void button0_4_Click(object sender, EventArgs e)
        {
            button_click(0, 4);

            button0_4.Text = player_matrix[0, 4].ToString();
        }

        private void button1_0_Click(object sender, EventArgs e)
        {
            button_click(1, 0);

            button1_0.Text = player_matrix[1, 0].ToString();
        }

        private void button1_1_Click(object sender, EventArgs e)
        {
            button_click(1, 1);

            button1_1.Text = player_matrix[1, 1].ToString();
        }

        private void button1_2_Click(object sender, EventArgs e)
        {
            button_click(1, 2);

            button1_2.Text = player_matrix[1, 2].ToString();
        }

        private void button1_3_Click(object sender, EventArgs e)
        {
            button_click(1, 3);

            button1_3.Text = player_matrix[1, 3].ToString();
        }

        private void button1_4_Click(object sender, EventArgs e)
        {
            button_click(1, 4);

            button1_4.Text = player_matrix[1, 4].ToString();
        }

        private void button2_0_Click(object sender, EventArgs e)
        {
            button_click(2, 0);

            button2_0.Text = player_matrix[2, 0].ToString();
        }

        private void button2_1_Click(object sender, EventArgs e)
        {
            button_click(2, 1);

            button2_1.Text = player_matrix[2, 1].ToString();
        }

        private void button2_2_Click(object sender, EventArgs e)
        {
            button_click(2, 2);

            button2_2.Text = player_matrix[2, 2].ToString();
        }

        private void button2_3_Click(object sender, EventArgs e)
        {
            button_click(2, 3);


            button2_3.Text = player_matrix[2, 3].ToString();
        }

        private void button2_4_Click(object sender, EventArgs e)
        {
            button_click(2, 4);


            button2_4.Text = player_matrix[2, 4].ToString();
        }

        private void button3_0_Click(object sender, EventArgs e)
        {
            button_click(3, 0);


            button3_0.Text = player_matrix[3, 0].ToString();
        }

        private void button3_1_Click(object sender, EventArgs e)
        {
            button_click(3, 1);


            button3_1.Text = player_matrix[3, 1].ToString();
        }

        private void button3_2_Click(object sender, EventArgs e)
        {
            button_click(3, 2);


            button3_2.Text = player_matrix[3, 2].ToString();
        }

        private void button3_3_Click(object sender, EventArgs e)
        {
            button_click(3, 3);


            button3_3.Text = player_matrix[3, 3].ToString();
        }

        private void button3_4_Click(object sender, EventArgs e)
        {
            button_click(3, 4);


            button3_4.Text = player_matrix[3, 4].ToString();
        }

        private void button4_0_Click(object sender, EventArgs e)
        {
            button_click(4, 0);


            button4_0.Text = player_matrix[4, 0].ToString();
        }

        private void button4_1_Click(object sender, EventArgs e)
        {
            button_click(4, 1);


            button4_1.Text = player_matrix[4, 1].ToString();
        }

        private void button4_2_Click(object sender, EventArgs e)
        {
            button_click(4, 2);


            button4_2.Text = player_matrix[4, 2].ToString();
        }

        private void button4_3_Click(object sender, EventArgs e)
        {
            button_click(4, 3);


            button4_3.Text = player_matrix[4, 3].ToString();
        }

        private void button4_4_Click(object sender, EventArgs e)
        {
            button_click(4, 4);


            button4_4.Text = player_matrix[4, 4].ToString();
        }

        private void button_rule_Click(object sender, EventArgs e)
        {
            MessageBox.Show("У вас есть квадратное поле 5х5 клеток. Вам нужно заполнить его числами от 1 до 13." +
    " Каждое число будет выпадать из набора карточек, каждое из которых содержит число от 1 до 13," +
    " причем каждое число встречается четырежды. Когда выпадает число, запишите его в любую клетку поля." +
    " Переставлять числа после записи нельзя. Продолжайте заполнять клетки случайными числами до заполнения всего поля." +
    " Очки выдаются за комбинации чисел в ряду, столбце и диагонали");
        }
    }
}
