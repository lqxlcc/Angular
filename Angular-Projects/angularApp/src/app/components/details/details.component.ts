import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.scss']
})
export class DetailsComponent implements OnInit {
    baseURI:string = "https://imgjd4.fruitday.com/up_images/";
    imgurl : Array<string> =[
    "20170119/14848126999545.gif",
    "20170119/14848127023726.gif",
    "20170119/14848127053393.gif",
    "20170119/1484812708160.gif",
    "20170119/14848127116332.gif",
    "20170119/14848127136363.gif",
    "20170119/14848127163870.gif",
    "20170119/14848127196121.gif",
    "20171220/1513762362174.jpg"
    ] ;

    constructor() { }

     ngOnInit() {
      }

}
