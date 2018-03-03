import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
@Component({
  selector: 'app-myorder',
  templateUrl: './myorder.component.html',
  styleUrls: ['./myorder.component.css']
})
export class MyorderComponent implements OnInit {

  constructor(private http:Http) { }

  ngOnInit() {
  }

}
