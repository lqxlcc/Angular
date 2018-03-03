import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {

  constructor(private http:Http) { }

  ngOnInit() {
  }

}
