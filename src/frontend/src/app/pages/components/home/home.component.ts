import { Component, OnInit } from '@angular/core';
import { KeystoreService } from '../../services/keystore.service';

@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  result: any;

  constructor(private keystoreService: KeystoreService) { }

  ngOnInit(): void {
    this.getKey();
  }

  getKey(): void{
    this.keystoreService.getKey()
      .subscribe(data => {
        this.result = data;
        console.log(this.result);
      })
  }
}
