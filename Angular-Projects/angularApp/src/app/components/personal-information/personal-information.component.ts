import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-personal-information',
  templateUrl: './personal-information.component.html',
  styleUrls: ['./personal-information.component.scss']
})
export class PersonalInformationComponent implements OnInit {

  constructor(private router:Router) { }

  ngOnInit() {
  }
  goLogin(){
     this.router.navigateByUrl("login"); 
  }
  goAddressM(){
    this.router.navigateByUrl("addressM"); 
  }
}
