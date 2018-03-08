import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-mine',
  templateUrl: './mine.component.html',
  styleUrls: ['./mine.component.scss']
})
export class MineComponent implements OnInit {
   phone: string = '';
    constructor(private http:Http,private router:Router) { }

    ngOnInit() {
      this.phone = localStorage.getItem('phone');
    }

    goOrder(){
        this.router.navigateByUrl("myorder/orderAll");  
    }
    goPersonal(){
        this.router.navigateByUrl("personalInformation");  
    }


}
