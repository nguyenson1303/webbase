import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminpageactionComponent } from './adminpageaction.component';

describe('AdminpageactionComponent', () => {
  let component: AdminpageactionComponent;
  let fixture: ComponentFixture<AdminpageactionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminpageactionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminpageactionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
