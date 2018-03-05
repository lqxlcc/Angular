import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListdatagridComponent } from './listdatagrid.component';

describe('ListdatagridComponent', () => {
  let component: ListdatagridComponent;
  let fixture: ComponentFixture<ListdatagridComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListdatagridComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListdatagridComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
