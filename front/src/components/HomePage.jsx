import React, {useEffect, useState} from 'react';
import axios from 'axios';

const BOOKS_SERVICE_URL = process.env.REACT_APP_BOOKS_SERVICE_URL; // Those var are undefined so the env don't work : fix this
const USER_SERVICE_URL = process.env.REACT_APP_USER_SERVICE_URL;

const fetchBooks = async () => {
    try{
        const response = await axios.get(`${BOOKS_SERVICE_URL}/books`);
        return response.data;
    }catch(error){
        console.error('Error fetching books', error);
        return [];
    }
}

const fetchHello = async () => {
    try{
        const response = await axios.get(`${USER_SERVICE_URL}/hello`);
        return response.data;
    }catch(error){
        console.error('Error fetching hello', error);
        return 'error';
    }
}

const HomePage = () => {
    const [books, setBooks] = useState([]);
    const [hello, setHello] = useState('');

    useEffect(() => {
        fetchBooks().then(books => setBooks(books));
        fetchHello().then(hello => setHello(hello));
    }, []);

    return (
        <div>
        <h1>Hello message from the 2 services</h1>
        <p>{hello}</p>
        <h1>Books</h1>
        <ul>
        {books.map(book => (
            <li key={book.isbn}>{book.title}</li>
        ))}
        </ul>
        <p>{BOOKS_SERVICE_URL}</p>
        </div>
    );
}

export default HomePage;