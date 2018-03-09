import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-personal-information',
  templateUrl: './personal-information.component.html',
  styleUrls: ['./personal-information.component.scss']
})
export class PersonalInformationComponent implements OnInit {
  phone: string = '';
  constructor(private router:Router) { }

  ngOnInit() {
    this.phone = localStorage.getItem('phone');
  }
  goLogin(){
     this.router.navigateByUrl("login"); 
     localStorage.setItem('phone','');
     localStorage.setItem('id','');
  }
  goAddressM(){
    this.router.navigateByUrl("addressM"); 
  }
}
