import { Component, OnInit, Input, OnDestroy, ViewChild } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpEventType, HttpRequest, HttpErrorResponse, HttpEvent } from '@angular/common/http';

import { Observable, Subscription, Subject, asapScheduler, pipe, of, from } from 'rxjs';
import { catchError, map, tap, filter, scan } from 'rxjs/operators';
import { Router } from '@angular/router';

import { FormsModule, FormBuilder, FormGroup, FormControl, FormArray, Validators, AbstractControl, NgForm } from '@angular/forms';
import { FileSelectDirective, FileDropDirective, FileUploader } from 'ng2-file-upload/ng2-file-upload';
import { saveAs } from 'file-saver';

import { AlertsService } from 'angular-alert-module';
import { UserService } from '../../services/user.service';
import { User } from '../../model/user.model';


const uri = 'http://localhost:3000/file/upload';
const URL = 'http://localhost:3000/fileUpload/uploadPost';
@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  // @input() getPosts();

  // file upload using ng2-file-upload
  uploader: FileUploader = new FileUploader({ url: uri });
  attachmentList: any = [];

  // file upload using formData
  get f() { return this.uploadForm.controls; }
  // Create Variable for your file and formdata.
  uploadFiles: Array<File> = [];
  file: Array<File> = [];

  user_id: string;
  // User = [];
  // selectedUser: User;
  users: User[];

  constructor(private userService: UserService, private http: HttpClient, private formBuilder: FormBuilder, private router: Router,
    private alerts: AlertsService) {
    /*this.uploader.onCompleteItem = (item: any, response: any, status: any, headers: any) => {
      return this.attachmentList.push(JSON.parse(response));
    };*/
    // username login authentication
    this.upload();
    this.userService.getUser_id()
      .subscribe(
        data => {
          this.user_id = data.toString();
          this.getUserProfile(this.user_id);
        },
        error => this.router.navigate(['/login'])
        // this.router.navigateByUrl('/login');
      );
    this.uploadFormValidation();
  }

  uploadForm: FormGroup;

  ngOnInit() { }
  // Form validation ..
  uploadFormValidation() {
    this.uploadForm = this.formBuilder.group({
      user_id: [null, []],
      description: [null, [Validators.required, Validators.minLength(4)]],
      filePost: [null, []]
    });
  }
  // upload file ..
  upload() {
    this.uploader.onCompleteItem = (item: any, response: any, status: any, headers: any) => {
      return this.attachmentList.push(JSON.parse(response));
    };
  }
  // download file...
  download(index) {
    const filename = this.attachmentList[index].uploadname;
    this.userService.downloadFile(filename)
      .subscribe(
        data => saveAs(data, filename),
        error => console.error(error)
      );
  }
  // Get user details from DB
  getUserProfile(user_id) {
    this.userService.getUserProfile(user_id).subscribe((data) => {
      // console.log(data);
      this.users = data;
    },
      error => {
        return console.log(error);
      }
    );
  }



  // When file change is detected append your file to your formdata and on submit post the request.
  filePostEvent(event) {
    this.uploadFiles = event.target.files;
    // console.log(this.uploadFiles, 'uploadFiles');
    for (let i = 0; i < event.target.files.length; i++) {
      const name = event.target.files[i].name;
      const type = event.target.files[i].type;
      const size = event.target.files[i].size;
      const modifiedDate = event.target.files[i].lastModifiedDate;
      // debugger
      console.log('Name: ' + name + '\n' +
        'Type: ' + type + '\n' +
        'Last-Modified-Date: ' + modifiedDate + '\n' +
        'Size: ' + Math.round(size / 1024) + 'KB');
      /*if (this.selectedFiles) {
        return this.onSubmit(this.uploadForm);
      }*/
    }
  }

  onSubmit(uploadForm) {
    const formData: any = new FormData();
    const files: Array<File> = this.uploadFiles;
    // console.log(files, 'files');
    formData.append('description', uploadForm.get('description').value);
    formData.append('user_id', this.user_id);

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      formData.append('files[]', file);
    }
    return this.http.post(URL, formData).subscribe((data) => {
      console.log(data);
      // this.getPosts();
      });
  }



  logOut() {
    localStorage.removeItem('token');
    this.router.navigate(['login']);
  }



} // Code Ends here

















/*

<form [formGroup] = "form" (ngSubmit)="onEventSubmit()">
<input type="file" id="eventimage" name="eventimage"  formControlName="eventimage" (change)="fileChangeEvent($event)" >

<input type="submit" class="btn btn-primary" value="Submit">
</form>

fileChangeEvent(event) {
  let files = event.target.files;
  if (files.length > 0) {
    let file = files[0];
    let formData = new FormData();
    formData.append('eventimage', file, file.name);
    this.file_form = formData;
  }
}

addNewEvent(event) {
  return this.http.post(this.domain + '/event', { headers: this.headers }, event).map(res => res.json());
}
*/

/*

 onSubmit(uploadForm) {
    // const Data = this.uploadForm.value;
    // console.log(Data, 'Data');
   const headers = new HttpHeaders();
// this is the important step. You need to set content type as null
    headers.set('Content-Type', null);
    headers.set('Accept', 'multipart/form-data');
    const params = new HttpParams();

    const uploadData: any = new FormData();
    const files: Array<File> = this.selectedFiles;

    // console.log(files,  'files');
    // console.log(uploadData, 'uploadData');
    // single file Upload
    // uploadData.append('filesData[]', files[0].name);
    // uploadData.append('filesData[]',  files[0].size);
    // uploadData.append('filesData[]',  files[0].type);

    uploadData.append('description', this.uploadForm.get('description').value);
    uploadData.append('user_id', this.uploadForm.get('user_id').value);

    // uploadData.append('filesData[]', [ files ]);

    for (let i = 0; i < this.selectedFiles.length; i++) {
      // uploadData.append('filesData[]',  [ [ files[i]['name']], [files[i]['size']], [files[i]['type']] ] );
      //  uploadData.append('filesData[]', [files[i].name, files[i].size, files[i].type] );
       // uploadData.append('filesData[]',  [files[i]['name']]);
       // uploadData.append('filesData[]',  files[i]['size']);
       // uploadData.append('filesData[]',  files[i]['type']);
    }

    return this.http.post(URL, uploadData,  { params, headers } ).subscribe((data) => { console.log(data); });
  }


*/





















