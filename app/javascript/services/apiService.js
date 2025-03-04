import axios from 'axios';
import env from '@/environments/env';

const apiService = {
  async get(endpoint) {
    try {
            const response = await axios.get(`${env.baseUrl}${endpoint}`);
            return response.data;
        } catch (error) {
            console.error("API Error:", error);
            throw error;
        }
  },

  async post(endpoint, data) {
    try {
          const response = await axios.post(`${env.baseUrl}${endpoint}`, data);
          return response.data;
      } catch (error) {
          console.error("API Error:", error);
          throw error;
      }
  },
};

export default apiService;