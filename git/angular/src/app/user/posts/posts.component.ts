import { Component, OnInit, Input, OnDestroy, ViewChild } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpEventType, HttpRequest, HttpErrorResponse, HttpEvent } from '@angular/common/http';

import { Observable, Subscription, Subject, asapScheduler, pipe, of, from } from 'rxjs';
import { catchError, map, tap, filter, scan } from 'rxjs/operators';
import { Router } from '@angular/router';
import { FormsModule, FormBuilder, FormGroup, FormControl, FormArray, Validators, AbstractControl, NgForm } from '@angular/forms';
// import { environment } from '../../../../environments/environment';


import { AlertsService } from 'angular-alert-module';
import { UserService } from '../../services/user.service';
import { User } from '../../model/user.model';
import { Post } from '../../model/post.model';
import { File } from '../../model/file.model';
import { Like } from '../../model/like.model';
import { Comment } from '../../model/comment.model';



@Component({
  selector: 'app-posts',
  templateUrl: './posts.component.html',
  styleUrls: ['./posts.component.css']
})
export class PostsComponent implements OnInit {
  // Set server = 'localhost:3000/';
  // apiUrl: string = 'localhost:3000';
  users: User[];
  user_id: string;
  posts: Post[];
  files: File[];
  post_id: any;
  saved_name = [];
  tmp_files = [];

  likes: Like[];
  like_id: number | null ;
  like_status: string;
  postLikes: any;

  comments: Comment[];
  comment_text: string;

  get f() { return this.commentForm.controls; }

  constructor(private userService: UserService, private http: HttpClient, private formBuilder: FormBuilder, private router: Router,
    private alerts: AlertsService) {
    this.userService.getUser_id()
      .subscribe(
        data => {
          this.user_id = data.toString();
          this.getPosts(this.user_id);
          this.getFiles(this.user_id);
          this.get_likes();
          this.getPostLikes(this.user_id);
          this.get_comments();
          // this.getPostsWithLikes();
        },
        error => this.router.navigate(['/login'])
        // this.router.navigateByUrl('/login');
      );
       this.commentFormValidation();

  }

  commentForm: FormGroup;
  ngOnInit() {   }

    commentFormValidation() {
     this.commentForm = this.formBuilder.group({
      comment: [null, [Validators.required, Validators.minLength(2)]]
    });
  }




  // Get user details from DB
  getPosts(user_id) {
    this.userService.getPosts(user_id).subscribe((data) => {
      this.posts = data;
      // this.post_id = this.posts.post_id;
      //  this.tmp_files = this.posts.map(post => post.saved_name);
      // console.log(data, 'data', this.posts);
      // this.getPostsWithLikes();
    },
      error => {
        return console.log(error);
      }
    );
  }



  // Get user details from DB
  getFiles(user_id) {
    this.userService.getFiles(user_id).subscribe((results) => {
      this.files = results;
      // console.log(results, 'results', this.files);
    },
      error => {
        return console.log(error);
      }
    );
  }



  // get total likes
  get_likes() {
    this.userService.get_likes().subscribe((results) => {
      this.likes = results;
      // this.like_status = this.likes[1].like_status;
      // console.log(results, 'results', this.like_status, 'likes');
    },
      error => {
        return console.log(error);
      }
    );
  }

   public getPostsWithLikes() {
    this.posts.map(post => {
      const like = this.likes && this.likes.find(plike => post.user_id === plike.user_id && post.post_id === plike.post_id);
      return {post, like};
    });
    }

  // join postlikes
  getPostLikes(user_id) {
    // debugger
    this.userService.get_PostLikes(user_id).subscribe((results) => {
      this.postLikes = results;
     // console.log(results, 'results', this.postLikes, 'likes');
    },
      error => {
        return console.log(error);
      }
    );
  }

  // like form submit
  likeSubmit(userid, postid ) {
    const like_status = 'like';
    const config = {userid, postid, like_status };
    // alert(userid);
   this.userService.like_Submit(config).subscribe((data) => {
     // console.log(data);
     this.get_likes();
     this.getPostLikes(this.user_id);
    });
     }


  // like form submit
  comment_Submit(userid, postid, commentForm ) {
    const comment = commentForm.get('comment').value;
    const comments_data = {userid, postid, comment  };
    // alert(comment);
   this.userService.comment_Submit(comments_data, commentForm.value).subscribe((data) => {
     // console.log(data);
     this.get_comments();
     });
  }



  // get total comments
  get_comments() {
    this.userService.get_comments().subscribe((results) => {
      this.comments = results;
      // console.log(results, 'results', this.comment_text, 'comments');
    },
      error => {
        return console.log(error);
      }
    );
  }












} // Code Ends..









/*
      if (this.like_status = 'like') {
      console.log('Even');
      // dislike_update();
      this.userService.like_update(likeForm.value).subscribe((data) => { console.log(data); });
    } else {
      console.log('Odd');
      // like_insert();
    }
    */
      // const formData: any = new FormData();
      // return this.http.post(formData).subscribe((data) => { console.log(data); });
      // this.userService.like(loginForm.value).subscribe((data)





