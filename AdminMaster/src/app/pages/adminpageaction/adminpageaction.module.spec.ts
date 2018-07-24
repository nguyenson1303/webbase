import { AdminpageactionModule } from './adminpageaction.module';

describe('AdminpageactionModule', () => {
  let adminpageactionModule: AdminpageactionModule;

  beforeEach(() => {
    adminpageactionModule = new AdminpageactionModule();
  });

  it('should create an instance', () => {
    expect(adminpageactionModule).toBeTruthy();
  });
});
