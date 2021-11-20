import { Component, OnInit } from '@angular/core';
import { HomeService } from './home.service';

@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  result: any;

  constructor(private homeService: HomeService) { }

  ngOnInit(): void {
    this.getKey();
  }

  getKey(): void{
    this.homeService.getKey()
      .subscribe(data => {
        this.result = data;
        console.log(this.result);
      })
  }
}
