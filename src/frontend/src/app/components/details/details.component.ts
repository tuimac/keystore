import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Keystore } from '../../models/keystore';
import { KeystoreService } from '../../services/keystore.service';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.scss']
})
export class DetailsComponent implements OnInit {

  keyid: any;
  info: any;

  constructor(
    private activatedRoute: ActivatedRoute,
    private keystoreService: KeystoreService
  ) { }

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(params => {
      this.keyid = params.get('keyid');
    });
    this.getInfo(this.keyid);
  }
  
  getInfo(keyid: any): void {
    this.keystoreService.getKey(keyid)
      .subscribe((data: Keystore[]) => {
        console.log(data);
        this.info = data[0];
      })
  }
}
