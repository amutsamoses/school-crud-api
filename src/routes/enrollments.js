module.exports = (sequelize, DataTypes) => {
  const Enrollment = sequelize.define(
    "Enrollment",
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      student_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "students",
          key: "id",
        },
        onDelete: "CASCADE",
        onUpdate: "CASCADE",
      },
      course_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "courses",
          key: "id",
        },
        onDelete: "CASCADE",
        onUpdate: "CASCADE",
      },
      enrollment_date: {
        type: DataTypes.DATEONLY,
        defaultValue: DataTypes.NOW,
      },
      final_grade: {
        type: DataTypes.DECIMAL(3, 2),
      },
    },
    {
      tableName: "enrollments",
      timestamps: true, // created_at & updated_at
      underscored: true,
      indexes: [
        {
          unique: true,
          fields: ["student_id", "course_id"],
        },
      ],
    }
  );

  Enrollment.associate = (models) => {
    Enrollment.belongsTo(models.Student, {
      foreignKey: "student_id",
    });
    Enrollment.belongsTo(models.Course, {
      foreignKey: "course_id",
    });
  };

  return Enrollment;
};
