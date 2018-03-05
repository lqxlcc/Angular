import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import {Router} from '@angular/router';
@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {

  constructor(private http:Http,private router:Router) { }

  ngOnInit() {
  }
  gocategory(){
     this.router.navigateByUrl("category");  
  }
  gohome(){
    this.router.navigateByUrl("home");  
  }
  gocart(){
    this.router.navigateByUrl("cart");  
  }
  gomine(){
  this.router.navigateByUrl("mine"); 
  }
  
}
