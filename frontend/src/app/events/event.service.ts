import { Injectable } from '@angular/core';
// import { Response} from "@angular/http";
import {Observable} from "rxjs";
import 'rxjs/add/operator/map';  
import 'rxjs/add/operator/catch';
import { EnvironmentService } from "./../shared/environment/environment.service";
import { Ng4LoadingSpinnerService } from 'ng4-loading-spinner';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
@Injectable()
export class EventService {

  constructor(
    private _http: HttpClient,
    private environmentService: EnvironmentService
  ) {}

  getBooks(page){
    let url = this.environmentService.setApiServiceWithPage('event', page)
    return this._http.get(url)
        .map(res=> res)
        .catch(this.handleError)
  }

  getBookById($id){
    let url = this.environmentService.setApiServiceById('event', $id)
    return this._http.get(url)
        .map(res=> res)
        .catch(this.handleError)
  }

  addBooks(eventData){
    let url = this.environmentService.setApiService('event')
    return this._http.post(url, eventData)
        .map(res=> res)
        .catch(this.handleError)
  }

  updateBook(eventData){
    let url = this.environmentService.setApiServiceById('event', eventData.id)
    return this._http.put(url, eventData)
        .map(res=> res)
        .catch(this.handleError)
  }

  deleteBook($id){
    let url = this.environmentService.setApiServiceById('event', $id)
    return this._http.delete(url)
        .map(res=> res)
        .catch(this.handleError)
  }

  private handleError (error: HttpErrorResponse | any) {
    let errMsg: string;
    errMsg = error.error
    console.error(errMsg);
    return Observable.throw(errMsg);
  }

}
