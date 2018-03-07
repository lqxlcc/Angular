import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import {Router} from '@angular/router';

@Component({
  selector: 'app-mine',
  templateUrl: './mine.component.html',
  styleUrls: ['./mine.component.scss']
})
export class MineComponent implements OnInit {
   
    constructor(private http:Http,private router:Router) { }

    ngOnInit() {
    }

    goOrder(){
        this.router.navigateByUrl("myorder");  
    }
    goPersonal(){
        this.router.navigateByUrl("personalInformation");  
    }


}
