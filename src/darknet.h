

extern train_yolo(char *cfgfile, char *weightfile, char* trainImgFile, char* backupDir);
extern validate_yolo(char *cfgfile, char *weightfile);
extern validate_yolo_recall(char *cfgfile, char *weightfile);