import { Component, OnInit } from '@angular/core';
import { KeystoreService } from '../../services/keystore.service';
import { Keystore } from '../../models/keystore';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  result: any;
  displayedColumns: string[] = ['keyname', 'genre'];
  dataSource: any;

  constructor(private keystoreService: KeystoreService) { }

  ngOnInit(): void {
    this.getKey();
  }

  getKey(): void {
    this.keystoreService.getKey('')
      .subscribe((data: Keystore[]) => {
        this.dataSource = new MatTableDataSource<Keystore>(data);
      })
  }
}

