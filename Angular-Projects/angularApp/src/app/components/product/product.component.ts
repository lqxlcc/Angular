import { Component, OnInit } from '@angular/core';
import global from '../../utils/global'

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss'],
})

export class ProductComponent implements OnInit {

    constructor() {
    }
    ngOnInit() {

    }

    goto(){
        history.go(-1);
    }
}
