import React, { useState, useEffect } from 'react';
import api from './api';
import * as Lucide from 'lucide-react';

function App() {
  // --- ESTADOS ---
  const [showWarningModal, setShowWarningModal] = useState({ show: false, message: '', autoStart: false });
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const [questions, setQuestions] = useState([]);
  const [gameQuestions, setGameQuestions] = useState([]);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [score, setScore] = useState(0);
  const [gameState, setGameState] = useState('setup'); // setup, playing, finished
  const [loading, setLoading] = useState(false);
  const [limit, setLimit] = useState(5);
  
  const [shuffledAnswers, setShuffledAnswers] = useState([]);
  const [selectedAnswer, setSelectedAnswer] = useState(null);
  const [isAnswering, setIsAnswering] = useState(false);
  const [toast, setToast] = useState(null);

  const [newQuestionText, setNewQuestionText] = useState('');
  const [category, setCategory] = useState('');

  // --- BUSCA DE DADOS ---
  const fetchData = async () => {
      setLoading(true);
      try {
        const response = await api.get('/questions'); 
        if (response.data && Array.isArray(response.data)) {
          setQuestions(response.data);
        }
      } catch (err) {
        console.error("FALHA NA COMUNICAÇÃO:", err.message);
      } finally {
        setLoading(false);
      }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // --- LÓGICA DO QUIZ ---
  useEffect(() => {
    if (gameState === 'playing' && gameQuestions[currentQuestion]) {
      const answers = [...(gameQuestions[currentQuestion].answers || [])];
      setShuffledAnswers(answers.sort(() => Math.random() - 0.5));
      setSelectedAnswer(null);
      setIsAnswering(false);
    }
  }, [currentQuestion, gameQuestions, gameState]);

  const startGame = () => {
    const numLimit = parseInt(limit) || 1;

    // Caso 1: Banco Vazio
    if (questions.length === 0) {
      setShowWarningModal({ 
        show: true, 
        message: "Não há questões no momento.",
        autoStart: false 
      });
      return;
    }

    // Caso 2: Limite maior que o estoque
    if (numLimit > questions.length) {
      const shuffled = [...questions].sort(() => Math.random() - 0.5);
      setGameQuestions(shuffled); // Pega tudo o que tem
      setCurrentQuestion(0);
      setScore(0);
      setShowWarningModal({ 
        show: true, 
        message: `Você pediu ${numLimit} rounds, mas temos apenas ${questions.length} questões. O desafio começará com o máximo disponível!`,
        autoStart: true 
      });
      return;
    }

    // Caso Normal
    const shuffled = [...questions].sort(() => Math.random() - 0.5);
    setGameQuestions(shuffled.slice(0, numLimit));
    setCurrentQuestion(0);
    setScore(0);
    setGameState('playing');
  };

  const handleAnswerClick = (answer) => {
    if (isAnswering || !answer) return;
    
    setIsAnswering(true);
    setSelectedAnswer(answer);

    const check = answer.isCorrect ?? answer.correct ?? answer.status;
    const isCorrect = String(check) === "true";

    if (isCorrect) {
      setScore(prev => prev + 1);
    }

    setTimeout(() => {
      if (currentQuestion + 1 < gameQuestions.length) {
        setCurrentQuestion(prev => prev + 1);
      } else {
        setGameState('finished');
      }
    }, 1500);
  };

  const handleSave = async (e) => {
    e.preventDefault();
    const payload = {
      text: newQuestionText,
      category: category,
      answers: [
        { text: document.getElementById('correct-ans')?.value, isCorrect: true },
        { text: document.getElementById('wrong-1')?.value, isCorrect: false },
        { text: document.getElementById('wrong-2')?.value, isCorrect: false },
        { text: document.getElementById('wrong-3')?.value, isCorrect: false }
      ]
    };

    try {
      await api.post('/questions', payload);
      setToast("Questão gravada!");
      setNewQuestionText('');
      setCategory('');
      e.target.reset();
      fetchData();
      setTimeout(() => setToast(null), 3000);
    } catch (err) {
      setToast("Erro ao salvar.");
      setTimeout(() => setToast(null), 3000);
    }
  };

  const handleClearDatabase = async () => {
      try {
        await api.delete('/questions/all');
        setQuestions([]);
        setShowDeleteModal(false);
        setToast("Questões zeradas com sucesso!");
        setTimeout(() => setToast(null), 3000);
      } catch (err) {
        setToast("Erro ao zerar as questões.");
        setShowDeleteModal(false);
        setTimeout(() => setToast(null), 3000);
      }
  };

  if (loading) return (
    <div className="min-h-screen bg-[#0f172a] flex items-center justify-center font-black text-blue-500 animate-pulse text-2xl">
      CONECTANDO AO MYSQL...
    </div>
  );

  return (
    <div className="min-h-screen bg-[#0f172a] text-white p-4 font-sans">
      {toast && (
        <div className="fixed top-5 left-1/2 -translate-x-1/2 z-50 bg-emerald-600 px-6 py-3 rounded-2xl shadow-2xl flex items-center gap-3 border border-emerald-400 font-bold uppercase text-[10px] tracking-widest">
          <Lucide.CheckCircle2 size={16} /> {toast}
        </div>
      )}

      {/* MODAL DE AVISO / LIMITE EXCEDIDO */}
      {showWarningModal.show && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm">
          <div className="bg-slate-900 border border-slate-800 p-8 rounded-[2.5rem] max-w-sm w-full text-center space-y-6 shadow-2xl">
            <div className="w-16 h-16 bg-blue-500/10 text-blue-500 rounded-full flex items-center justify-center mx-auto">
              <Lucide.Info size={32} />
            </div>
            <div>
              <h2 className="text-2xl font-black uppercase italic tracking-tighter">Aviso</h2>
              <p className="text-slate-400 text-sm font-medium mt-2">{showWarningModal.message}</p>
            </div>
            <button 
              onClick={() => {
                const start = showWarningModal.autoStart;
                setShowWarningModal({ show: false, message: '', autoStart: false });
                if (start) setGameState('playing');
              }}
              className="w-full bg-blue-600 hover:bg-blue-500 py-4 rounded-2xl font-black uppercase tracking-widest transition-all"
            >
              Entendido!
            </button>
          </div>
        </div>
      )}

      {/* MODAL DE EXCLUSÃO ESTILIZADO */}
      {showDeleteModal && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/80 backdrop-blur-sm">
          <div className="bg-slate-900 border border-slate-800 p-8 rounded-[2.5rem] max-w-sm w-full text-center space-y-6 shadow-2xl">
            <div className="w-16 h-16 bg-red-500/10 text-red-500 rounded-full flex items-center justify-center mx-auto">
              <Lucide.AlertTriangle size={32} />
            </div>
            <div>
              <h2 className="text-2xl font-black uppercase italic tracking-tighter">Zerar Banco?</h2>
              <p className="text-slate-400 text-sm font-medium mt-2">
                Isso apagará permanentemente todas as perguntas e alternativas do MySQL.
              </p>
            </div>
            <div className="flex gap-3">
              <button onClick={() => setShowDeleteModal(false)} className="flex-1 bg-slate-800 hover:bg-slate-700 py-4 rounded-2xl font-bold transition-all">Cancelar</button>
              <button onClick={handleClearDatabase} className="flex-1 bg-red-600 hover:bg-red-500 py-4 rounded-2xl font-black uppercase tracking-widest transition-all">Confirmar</button>
            </div>
          </div>
        </div>
      )}

      <div className="max-w-4xl mx-auto space-y-8">
        <header className="flex items-center justify-between p-6 bg-slate-800/50 rounded-3xl border border-slate-700 backdrop-blur-md shadow-xl">
          <div className="flex items-center gap-3">
            <Lucide.BrainCircuit className="text-blue-500" size={32} />
            <h1 className="text-2xl font-black uppercase italic tracking-tighter">Trivia Core</h1>
          </div>
          <button onClick={() => setShowDeleteModal(true)} className="p-2 text-slate-600 hover:text-red-500 transition-colors">
            <Lucide.Trash2 size={24}/>
          </button>
        </header>

        <main>
          {gameState === 'setup' && (
            <div className="bg-slate-800 p-12 rounded-[2rem] border border-slate-700 text-center space-y-8 shadow-2xl relative overflow-hidden">
              <div className="absolute -top-10 -right-10 opacity-5 rotate-12">
                <Lucide.Gamepad2 size={200} />
              </div>
              <h2 className="text-3xl font-black uppercase tracking-tight">Configurar Partida</h2>
              <p className="text-slate-500 font-bold uppercase text-[10px] tracking-[0.2em]">Temos {questions.length} questões disponíveis</p>
              
              <div className="max-w-xs mx-auto space-y-2">
                <label className="text-[10px] font-black text-slate-600 uppercase tracking-widest">Quantidade de Rounds</label>
                <input 
                  type="text" 
                  inputMode="numeric" 
                  value={limit} 
                  onChange={(e) => setLimit(e.target.value.replace(/\D/g, ''))} 
                  className="w-full bg-slate-900 border border-slate-700 p-4 rounded-2xl text-center text-3xl font-black text-blue-400 outline-none focus:border-blue-500 transition-all" 
                />
              </div>
              
              <button onClick={startGame} className="bg-blue-600 hover:bg-blue-500 px-12 py-5 rounded-2xl font-black uppercase tracking-widest transition-all shadow-xl shadow-blue-900/40 active:scale-95">
                Iniciar Desafio
              </button>
            </div>
          )}

          {gameState === 'playing' && gameQuestions[currentQuestion] && (
            <div className="bg-slate-800 p-8 rounded-[2rem] border border-slate-700 shadow-xl space-y-8">
              <div className="flex justify-between items-center text-[10px] font-black uppercase text-slate-500 tracking-[0.2em]">
                <span className="bg-slate-900 px-3 py-1 rounded-full">{gameQuestions[currentQuestion].category}</span>
                <span className="text-blue-500">{currentQuestion + 1} / {gameQuestions.length}</span>
              </div>
              <h2 className="text-3xl font-bold leading-tight">{gameQuestions[currentQuestion].text}</h2>
              <div className="grid gap-4">
                {shuffledAnswers.map((ans, i) => {
                  const isCorrectValue = String(ans.isCorrect ?? ans.correct) === "true";
                  let style = "bg-slate-700/40 border-slate-600 hover:border-blue-500";

                  if (selectedAnswer) {
                    if (isCorrectValue) {
                      style = "bg-emerald-600 border-emerald-400 shadow-lg shadow-emerald-900/20 text-white opacity-100";
                    } else if (selectedAnswer === ans) {
                      style = "bg-red-600 border-red-400 text-white opacity-100";
                    } else {
                      style = "bg-slate-800/20 border-slate-700 opacity-30 text-slate-500";
                    }
                  }

                  return (
                    <button 
                      key={i} 
                      disabled={isAnswering} 
                      onClick={() => handleAnswerClick(ans)} 
                      className={`p-6 rounded-2xl border-2 transition-all text-left font-bold text-lg flex justify-between items-center ${style}`}
                    >
                      <div className="flex items-center gap-4">
                        <span className="w-8 h-8 bg-black/20 rounded-lg flex items-center justify-center text-sm">{String.fromCharCode(65 + i)}</span>
                        {ans.text}
                      </div>
                      {selectedAnswer && isCorrectValue && <Lucide.CheckCircle2 size={20} />}
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {gameState === 'finished' && (
            <div className="bg-slate-800 p-12 rounded-[2rem] text-center border border-slate-700 shadow-2xl space-y-6">
              <Lucide.Trophy className="w-24 h-24 text-yellow-500 mx-auto" />
              <h2 className="text-4xl font-black uppercase italic tracking-tighter">Resultado</h2>
              <p className="text-xl text-slate-400 font-medium">Você dominou <span className="text-white font-black">{score}</span> de {gameQuestions.length} questões</p>
              <button onClick={() => setGameState('setup')} className="bg-blue-600 hover:bg-blue-500 px-12 py-5 rounded-2xl font-black uppercase transition-all shadow-lg shadow-blue-900/20">
                Voltar ao Menu
              </button>
            </div>
          )}
        </main>

        {gameState !== 'playing' && (
          <section className="bg-slate-800/50 p-8 rounded-[2.5rem] border border-slate-700/50">
            <h3 className="font-black uppercase mb-6 flex items-center gap-2 text-sm tracking-widest text-slate-400">
              <Lucide.PlusCircle className="text-emerald-500" size={18} /> Gerenciamento Manual
            </h3>
            <form onSubmit={handleSave} className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input className="bg-slate-900 p-4 rounded-xl outline-none focus:ring-2 focus:ring-blue-500 transition-all" placeholder="Pergunta" value={newQuestionText} onChange={e => setNewQuestionText(e.target.value)} required />
                <input className="bg-slate-900 p-4 rounded-xl outline-none focus:ring-2 focus:ring-blue-500 transition-all" placeholder="Categoria" value={category} onChange={e => setCategory(e.target.value)} required />
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input id="correct-ans" className="bg-slate-900 border border-emerald-900/30 p-4 rounded-xl outline-none focus:ring-2 focus:ring-emerald-500" placeholder="Resposta Correta" required />
                <input id="wrong-1" className="bg-slate-900 p-4 rounded-xl outline-none" placeholder="Errada 1" required />
                <input id="wrong-2" className="bg-slate-900 p-4 rounded-xl outline-none" placeholder="Errada 2" required />
                <input id="wrong-3" className="bg-slate-900 p-4 rounded-xl outline-none" placeholder="Errada 3" required />
              </div>
              <button className="w-full bg-emerald-600 hover:bg-emerald-500 py-4 rounded-xl font-black uppercase tracking-widest transition-all active:scale-[0.99]">Gravar no Banco SQL</button>
            </form>
          </section>
        )}
      </div>
    </div>
  );
}

export default App;