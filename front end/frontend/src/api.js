import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8080/api' // PRECISA ter o /api se a sua URL do navegador tem
});

export default api;