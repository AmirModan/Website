import React from 'react';
import Head from 'next/head'
import Header from '../../public/components/Header'
import CommentBox from '../../public/components/CommentBox'
import styles from '../../public/css/Projects/Tic-Tac-Toe_React.module.css'

/*
class Square extends React.Component {

  render() {
    return (
      <button className="square"
        onClick={() => this.props.onClick()}>
        {this.props.value}
      </button>
    );
  }
}*/

function Square(props) {
    return (
        <button className={styles.square} onClick={props.onClick}>
            {props.value}
        </button>
    );
}

class Board extends React.Component {

    /*constructor(props) {
      super(props);
      this.state = {
        squares: Array(9).fill(null),
        xIsNext: true,
      }
    }*/

    /*handleClick(i) {
      const squares = this.state.squares.slice();
      if(calculateWinner(squares) || squares[i]) {
        return;
      }
      squares[i] = this.state.xIsNext ? 'X' : 'O';
      this.setState({ 
        squares: squares,
        xIsNext: !this.state.xIsNext,
      });
    }*/

    renderSquare(i) {
        return <Square value={this.props.squares[i]}
            onClick={() => this.props.onClick(i)} />;
    }

    render() {
        /*const history = this.state.history;
        const current = history[history.length - 1];
        const winner = calculateWinner(this.state.squares);
        let status;
        if(winner) {
          status = 'Winner ' + winner;
        }
        else {
          status = 'Next player: ' + (this.state.xIsNext ? 'X' : 'O');
        }*/

        return (
            <div>
                <div className={styles.boardrow}>
                    {this.renderSquare(0)}
                    {this.renderSquare(1)}
                    {this.renderSquare(2)}
                </div>
                <div className={styles.boardrow}>
                    {this.renderSquare(3)}
                    {this.renderSquare(4)}
                    {this.renderSquare(5)}
                </div>
                <div className={styles.boardrow}>
                    {this.renderSquare(6)}
                    {this.renderSquare(7)}
                    {this.renderSquare(8)}
                </div>
            </div>
        );
    }
}

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            history: [
                {
                    squares: Array(9).fill(null)
                }
            ],
            stepNumber: 0,
            xIsNext: true
        };
    }

    handleClick(i) {
        const history = this.state.history.slice(0, this.state.stepNumber + 1);
        const current = history[history.length - 1];
        const squares = current.squares.slice();
        if (calculateWinner(squares) || squares[i]) {
            return;
        }
        squares[i] = this.state.xIsNext ? "X" : "O";
        this.setState({
            history: history.concat([
                {
                    squares: squares
                }
            ]),
            stepNumber: history.length,
            xIsNext: !this.state.xIsNext
        });
    }

    jumpTo(step) {
        this.setState({
            stepNumber: step,
            xIsNext: (step % 2) === 0
        });
    }

    render() {
        const history = this.state.history;
        const current = history[this.state.stepNumber];
        const winner = calculateWinner(current.squares);

        const moves = history.map((step, move) => {
            const desc = move ?
                'Go to move #' + move :
                'Go to game start';
            return (
                <li key={move}>
                    <button onClick={() => this.jumpTo(move)}>{desc}</button>
                </li>
            );
        });

        let status;
        if (winner) {
            status = "Winner: " + winner;
        } else {
            status = "Next player: " + (this.state.xIsNext ? "X" : "O");
        }

        return (
            <>
                <Head>
                    <title>Tic-Tac-Toe</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1" />
                </Head>
                <Header header1="Tic-Tac-Toe" />

                <div class="main-content">
                    <div id="projects-section">
                        <div class="content center">
                            <h1>Tic-Tac-Toe</h1>
                        </div>
                        <div id="Tic-Tac-Toe" class="project">
                            <div class="images-container">
                                <div class="image-container">
                                    <div className={styles.gameinfo}>
                                        <div>{status}</div>
                                        <ol>{moves}</ol>
                                    </div>
                                </div>
                                <div class="text-container">
                                    <div className={styles.game}>
                                        <div className="game-board">
                                            <Board
                                                squares={current.squares}
                                                onClick={i => this.handleClick(i)}
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="textbox-container">
                                <CommentBox pageName="Tic-Tac-Toe" />
                            </div>
                        </div>
                    </div>
                </div>
            </>
        );
    }
}

// ========================================

//const root = ReactDOM.createRoot(document.getElementById("root"));
//root.render(<Game />);

function calculateWinner(squares) {
    const lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ];
    for (let i = 0; i < lines.length; i++) {
        const [a, b, c] = lines[i];
        if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
            return squares[a];
        }
    }
    return null;
}
export default Game