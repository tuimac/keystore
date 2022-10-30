import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { Keystore } from '../models/keystore';

@Injectable({
  providedIn: 'root'
})
export class KeystoreService {

  public url: string = window.location.protocol + '//' + window.location.hostname + '/api/keystore/'

  constructor(private http: HttpClient) { }

  getKey(): Observable<Keystore[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    return this.http.get<Keystore[]>(
      `${this.url}`,
      { headers },
    ).pipe(
      map((data: Keystore[]) => {
        console.log(data);
        return data;
      },
      catchError(error => {
        return throwError('Runcommand: There are some error.');
      }))
    );
  }
}
