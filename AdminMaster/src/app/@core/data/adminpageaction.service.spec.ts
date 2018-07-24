import { TestBed, inject } from '@angular/core/testing';

import { AdminpageactionService } from './adminpageaction.service';

describe('AdminpageactionService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AdminpageactionService]
    });
  });

  it('should be created', inject([AdminpageactionService], (service: AdminpageactionService) => {
    expect(service).toBeTruthy();
  }));
});
