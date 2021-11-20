import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  public url: string = window.location.protocol + '//' + window.location.hostname + '/api/keystore/'

  constructor(private http: HttpClient) { }

  getKey() {
    console.log(this.url);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    return this.http.get(
      `${this.url}`,
      { headers },
    ).pipe(
      map((data) => {
        return data;
      },
      catchError(error => {
        return throwError('KeyStore: There are some error.');
      }))
    );
  }
}
