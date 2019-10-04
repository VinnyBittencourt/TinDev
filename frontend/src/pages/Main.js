import React, { useEffect } from "react";
import "./Main.css";

import api from "../services/api";

import logo from "../assets/logo.svg";
import like from "../assets/like.svg";
import dislike from "../assets/dislike.svg";

export default function Main({ match }) {
  useEffect(() => {
    async function loadUsers() {
      const response = await api.get("/devs", {
        headers: {
          user: match.params.id
        }
      });
      console.log(response.data);
    }
    loadUsers();
  }, [match.params.id]);
  return (
    <div className='main-container'>
      <img src={logo} alt='Tindev' />
      <ul>
        <li>
          <img
            src='https://avatars0.githubusercontent.com/u/38366235?v=4'
            alt=''
          />
          <footer>
            <strong>Vinny Bittencourt</strong>
            <p>Um programador full-stack que ama a sua namorada.</p>
          </footer>
          <div className='buttons'>
            <button type='button'>
              <img src={dislike} alt='dislike' />
            </button>
            <button type='button'>
              <img src={like} alt='like' />
            </button>
          </div>
        </li>
        <li>
          <img
            src='https://avatars0.githubusercontent.com/u/38366235?v=4'
            alt=''
          />
          <footer>
            <strong>Vinny Bittencourt</strong>
            <p>Um programador full-stack que ama a sua namorada.</p>
          </footer>
          <div className='buttons'>
            <button type='button'>
              <img src={dislike} alt='dislike' />
            </button>
            <button type='button'>
              <img src={like} alt='like' />
            </button>
          </div>
        </li>
        <li>
          <img
            src='https://avatars0.githubusercontent.com/u/38366235?v=4'
            alt=''
          />
          <footer>
            <strong>Vinny Bittencourt</strong>
            <p>Um programador full-stack que ama a sua namorada.</p>
          </footer>
          <div className='buttons'>
            <button type='button'>
              <img src={dislike} alt='dislike' />
            </button>
            <button type='button'>
              <img src={like} alt='like' />
            </button>
          </div>
        </li>
        <li>
          <img
            src='https://avatars0.githubusercontent.com/u/38366235?v=4'
            alt=''
          />
          <footer>
            <strong>Vinny Bittencourt</strong>
            <p>Um programador full-stack que ama a sua namorada.</p>
          </footer>
          <div className='buttons'>
            <button type='button'>
              <img src={dislike} alt='dislike' />
            </button>
            <button type='button'>
              <img src={like} alt='like' />
            </button>
          </div>
        </li>
        <li>
          <img
            src='https://avatars0.githubusercontent.com/u/38366235?v=4'
            alt=''
          />
          <footer>
            <strong>Vinny Bittencourt</strong>
            <p>Um programador full-stack que ama a sua namorada.</p>
          </footer>
          <div className='buttons'>
            <button type='button'>
              <img src={dislike} alt='dislike' />
            </button>
            <button type='button'>
              <img src={like} alt='like' />
            </button>
          </div>
        </li>
      </ul>
    </div>
  );
}
