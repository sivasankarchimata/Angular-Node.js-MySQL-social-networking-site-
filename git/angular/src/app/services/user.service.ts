import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpEventType, HttpRequest, HttpErrorResponse, HttpEvent } from '@angular/common/http';

import { Observable, Subscription, Subject, asapScheduler, pipe, of, from } from 'rxjs';
// import { ErrorObservable } from 'rxjs/observable/ErrorObservable';
// import { catchError, map, tap, filter, scan } from 'rxjs/operators';

import { Router } from '@angular/router';

import { User } from '../model/user.model';
import { State } from '../model/state.model';
import { City } from '../model/city.model';
import { Fruit } from '../model/fruit.model';
import { Post } from '../model/post.model';
import { File } from '../model/file.model';
import { Like } from '../model/like.model';
import { Comment } from '../model/comment.model';

/* APIs for every thing  */

@Injectable({
  providedIn: 'root'
})

export class UserService {

  // apiBaseURL = 'http://127.0.0.1:8000/api/'
  readonly baseURL = 'http://localhost:3000/api/';
  readonly base_URL = 'http://localhost:3000/fileUpload/';
  params: string;
  constructor(private http: HttpClient, private router: Router) { }

  downloadFile(file: String) {
    const body = { filename: file };
    return this.http.post('http://localhost:3000/file/download', body, {
      responseType: 'blob',
      headers: new HttpHeaders().append('Content-Type', 'application/json')
    });
  }


  // get states
  getStates(): Observable<State[]> {
    return this.http.get<State[]>(this.baseURL + 'states');
  }
  // get cities
  getCities(selectedState_id: number): Observable<City[]> {
    return this.http.get<City[]>(this.baseURL + 'cities/' + selectedState_id);
  }
  // get fruits
  getFruits(): Observable<Fruit[]> {
    // debugger
    return this.http.get<Fruit[]>(this.baseURL + 'fruits');
  }


  /*/ HttpMethods
  getUserList() {
    return this.http.get(this.baseURL + 'users');
  }
  putUser(usr: User) {
    return this.http.put(this.baseURL + 'users/' + usr.user_id, usr);
  }*/

  // register user
  registerUser(usr: User) {
    // debugger
    return this.http.post<User>(this.baseURL + 'register', usr);
  }
  // authCredentials
  loginUser(body: any) {
    return this.http.post(this.baseURL + 'login', body, { observe: 'body' });
  }

  getUser_id() {
    return this.http.get(this.baseURL + 'user_id', {
      observe: 'body',
      params: new HttpParams().append('token', localStorage.getItem('token'))
    });
  }

  getUserProfile(user_id): Observable<User[]> {
    // debugger
    return this.http.get<User[]>(this.baseURL + 'profile/' + user_id);
  }


  getPosts(user_id): Observable<Post[]> {
    return this.http.get<Post[]>(this.base_URL + 'getPosts/' + user_id, { observe: 'body' });

  }

  getFiles(user_id): Observable<File[]> {
    return this.http.get<File[]>(this.base_URL + 'getFiles/' + user_id, { observe: 'body' });

  }

  get_likes(): Observable<Like[]> {
    return this.http.get<Like[]>(this.base_URL + `get_likes/`, { observe: 'body'  });
  }
  get_PostLikes(user_id): Observable<Like[]> {
    return this.http.get<Like[]>(this.base_URL + 'get_PostLikes/' + user_id, { observe: 'body'  });
  } // `get_PostLikes/${user_id}`

  like_Submit(config) {
    // debugger
    return this.http.post(this.base_URL + 'like_insert', config, {params: config });
  }


  comment_Submit(comments_data, body: any ): Observable<Comment[]> {
    return this.http.post<Comment[]>(this.base_URL + 'comment_insert', comments_data, { observe: 'body' });
  }

  get_comments(): Observable<Comment[]> {
    return this.http.get<Comment[]>(this.base_URL + `get_comments/`, { observe: 'body'  });
  }




  /*
    uploadPost(body: any) {
      return this.http.post(this.baseURL + 'uploadPost', body, { observe: 'body' });

    }
  */

  /*
    logOut() {
      localStorage.removeItem('token');
      // this.router.navigateByUrl('/login');
      this.router.navigate(['/login']);
    }
  */

} // COde Ends here..










/*/ New code to get profile
getProfile(users: User) {
  return this.http.get(this.baseURL + `profile/${users.user_id}`, {
    observe: 'body',
    // params: new HttpParams().append('token', localStorage.getItem('token'))
  });
}

editUser(user: User): Observable<any> {
  return this.http.put(this.baseURL + `profile/${user.user_id}`, user, { responseType: 'text' });
}
deleteUser(user: User): Observable<any> {
  return this.http.delete(this.baseURL + 'profile/' + user.user_id, { responseType: 'text' });
}
*/

/*/ Token Methods
setToken(token: string) {
  localStorage.setItem('token', token);
}

getToken() {
  return localStorage.getItem('token');
}

deleteToken() {
  localStorage.removeItem('token');
}
isLoggedIn() {
  return !!localStorage.getItem('token');
}
*/
/*
isLoggedIn() {
  const token = localStorage.getItem('token');
  if (token) {
    return true;
  } else {
    this.router.navigateByUrl('/login');
    return false;
  }
} */

/*
  getUserPayload() {
    const token = this.getToken();
    if (token) {
     const userPayload = atob(token.split('.')[1]);
      return JSON.parse(userPayload);
    } else {
      return null;
    }
  }
  isLoggedIn() {
    const userPayload = this.getUserPayload();
    if (userPayload) {
      return userPayload.exp > Date.now() / 1000;
    } else {
      return false;
    }
  }
*/


/*
saveUser(user){
    return this.http.post('http://localhost:8080/api/SaveUser/', user)
            .map((response: Response) =>response.json())
  }

  GetUser(){
    return this.http.get('http://localhost:8080/api/getUser/')
            .map((response: Response) => response.json())
  }
 deleteUser(id){
    return this.http.post('http://localhost:8080/api/deleteUser/',{'id': id})
            .map((response: Response) =>response.json())
  }

  */














