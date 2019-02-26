import { Component, OnInit, Input, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-dataCarousel',
  templateUrl: './dataCarousel.component.html',
  styleUrls: ['./dataCarousel.component.css']
})
export class DataCarouselComponent implements OnInit,OnDestroy {

  constructor() { }

  currentImg:number = 0;
  slideDirection:string = 'left';
  startX: number;
  endX: number;
  timer: number;

  @Input() banners: Array<string>;
  @Input() height: string;

  ngOnDestroy(){
    clearInterval(this.timer);
  }

  ngOnInit(){
    document.querySelector('.datacarousel')['style']['height'] = this.height;
    window['thisComponent'] = this;
    this.timer = setInterval(this.autoSlide,3000);
  }

  autoSlide(){
    window['thisComponent'].slideDirection = 'left';
    window['thisComponent'].currentImg++;
    if(window['thisComponent'].currentImg >= window['thisComponent'].banners.length){
      window['thisComponent'].currentImg = 0;
    }
  }

  goStart(event){
    clearInterval(this.timer);
    this.startX = event.targetTouches[0].clientX;
  }

  goMove(event){
    this.endX = event.targetTouches[0].clientX;
  }

  goEnd(){
    if(this.endX-this.startX > 0){
      this.slideDirection = 'right';
      this.currentImg--;
      if(this.currentImg < 0){
        this.currentImg = this.banners.length - 1;
      }
    }else if(this.endX-this.startX < 0){
      this.slideDirection = 'left';
      this.currentImg++;
      if(this.currentImg > this.banners.length - 1){
        this.currentImg = 0;
      }
    }
    this.timer = setInterval(window['thisComponent'].autoSlide,3000);
  }

}
