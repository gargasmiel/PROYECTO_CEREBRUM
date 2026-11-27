import axios from 'axios';

const API_URL = 'http//localhost:4000/api';

const axiosClient = axios.create ({
    baseURL: API_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});

axiosClient.interceptors.request.use ((config) => {
const token = localStorage.getItem('token');
if (token) {
  config.headers.Authorization = `Bearer ${token}`;
}
return config;    
});
export default axiosClient;