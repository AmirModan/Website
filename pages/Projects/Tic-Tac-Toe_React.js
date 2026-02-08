import React from 'react';
import Head from 'next/head';
import CommentBox from '../../public/components/CommentBox';
import { HomeIcon } from '@heroicons/react/24/outline';

function Square(props) {
  return (
    <button
      className="w-20 h-20 bg-white/20 backdrop-blur border-2 border-white/40 text-white text-2xl font-bold rounded-lg hover:bg-white/30 hover:border-white/60 transition-all duration-200 transform hover:scale-105 active:scale-95 shadow-lg"
      onClick={props.onClick}
    >
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
    return (
      <Square
        value={this.props.squares[i]}
        onClick={() => this.props.onClick(i)}
      />
    );
  }

  render() {
    return (
      <div className="space-y-2">
        <div className="flex gap-2 justify-center">
          {this.renderSquare(0)}
          {this.renderSquare(1)}
          {this.renderSquare(2)}
        </div>
        <div className="flex gap-2 justify-center">
          {this.renderSquare(3)}
          {this.renderSquare(4)}
          {this.renderSquare(5)}
        </div>
        <div className="flex gap-2 justify-center">
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
          squares: Array(9).fill(null),
        },
      ],
      stepNumber: 0,
      xIsNext: true,
    };
  }

  handleClick(i) {
    const history = this.state.history.slice(0, this.state.stepNumber + 1);
    const current = history[history.length - 1];
    const squares = current.squares.slice();
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    squares[i] = this.state.xIsNext ? 'X' : 'O';
    this.setState({
      history: history.concat([
        {
          squares: squares,
        },
      ]),
      stepNumber: history.length,
      xIsNext: !this.state.xIsNext,
    });
  }

  jumpTo(step) {
    this.setState({
      stepNumber: step,
      xIsNext: step % 2 === 0,
    });
  }

  render() {
    const history = this.state.history;
    const current = history[this.state.stepNumber];
    const winner = calculateWinner(current.squares);

    const moves = history.map((step, move) => {
      const desc = move ? 'Go to move #' + move : 'Go to game start';
      return (
        <li key={move}>
          <button onClick={() => this.jumpTo(move)}>{desc}</button>
        </li>
      );
    });

    let status;
    if (winner) {
      status = 'Winner: ' + winner;
    } else {
      status = 'Next player: ' + (this.state.xIsNext ? 'X' : 'O');
    }

    return (
      <>
        <Head>
          <title>Tic-Tac-Toe</title>
          <meta name="viewport" content="width=device-width, initial-scale=1" />
        </Head>

        <div className="min-h-screen bg-gradient-to-br from-slate-900 via-blue-900 to-purple-900">
          {/* Home Button */}
          <div className="fixed top-4 left-4 z-50">
            <a
              href="/"
              className="group flex items-center justify-center w-12 h-12 bg-white/10 backdrop-blur-lg rounded-full border border-white/20 hover:bg-white/20 hover:border-white/30 transition-all duration-300 shadow-lg hover:shadow-xl hover:scale-110 active:scale-95"
              aria-label="Home"
            >
              <HomeIcon className="w-6 h-6 text-white group-hover:text-blue-300 transition-colors duration-200" />
            </a>
          </div>

          <div className="container mx-auto px-4 py-8">
            <div className="text-center mb-12">
              <h1 className="text-5xl font-bold text-white mb-4 bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-purple-600">
                Tic-Tac-Toe
              </h1>
              <div className="w-32 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
            </div>

            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 hover:shadow-purple-500/20 transition-all duration-300">
              <div className="grid lg:grid-cols-2 gap-8">
                <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <div className="text-white">
                    <div className="text-2xl font-bold mb-4 text-center">
                      {status}
                    </div>
                    <ol className="space-y-2 max-h-96 overflow-y-auto">
                      {moves.map((move) => (
                        <li key={move.key} className="flex justify-center">
                          <button
                            onClick={() => move.props.onClick}
                            className="text-blue-300 hover:text-blue-400 hover:bg-white/10 px-4 py-2 rounded-lg transition-all duration-200"
                          >
                            {move.props.children}
                          </button>
                        </li>
                      ))}
                    </ol>
                  </div>
                </div>

                <div className="bg-white/5 backdrop-blur rounded-2xl p-6 border border-white/10">
                  <div className="flex justify-center items-center">
                    <div className="game-board">
                      <Board
                        squares={current.squares}
                        onClick={(i) => this.handleClick(i)}
                      />
                    </div>
                  </div>
                </div>
              </div>

              <div className="mt-8">
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
    [2, 4, 6],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
export default Game;
