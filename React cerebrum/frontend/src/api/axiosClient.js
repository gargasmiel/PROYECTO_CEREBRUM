import axios from 'axios';

const API_URL = 'http//localhost:3000/api';

const axiosClient = axios.create ({
    baseURL: API_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});

axiosClient.interceptors.request.use ((congig) => {
const token = localStorage.getItem('token');
if (token) {
    config.headers.Authorization = ´Bearer ${token}´
}
return config;    
});


export default axiosClient;